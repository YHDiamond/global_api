export const alexGeometry = {
  description: {
    identifier: "geometry.npc.alex",
    visible_bounds_width: 1,
    visible_bounds_height: 2,
    visible_bounds_offset: [0, 1, 0],
    texture_width: 64,
    texture_height: 64
  },
  bones: [
    {
      name: "root",
      pivot: [0.0, 0.0, 0.0]
    },
    {
      name: "waist",
      parent: "root",
      pivot: [0.0, 12.0, 0.0]
    },
    {
      name: "body",
      parent: "waist",
      pivot: [0.0, 24.0, 0.0],
      cubes: [
        {
          origin: [-4.0, 12.0, -2.0],
          size: [8, 12, 4],
          uv: [16, 16]
        }
      ]
    },
    {
      name: "head",
      parent: "body",
      pivot: [0.0, 24.0, 0.0],
      cubes: [
        {
          origin: [-4.0, 24.0, -4.0],
          size: [8, 8, 8],
          uv: [0, 0]
        }
      ]
    },
    {
      name: "hat",
      parent: "head",
      pivot: [0.0, 24.0, 0.0],
      cubes: [
        {
          origin: [-4.0, 24.0, -4.0],
          size: [8, 8, 8],
          uv: [32, 0],
          inflate: 0.5
        }
      ]
    },
    {
      name: "rightLeg",
      parent: "root",
      pivot: [-1.9, 12.0, 0.0],
      cubes: [
        {
          origin: [-3.9, 0.0, -2.0],
          size: [4, 12, 4],
          uv: [0, 16]
        }
      ]
    },
    {
      name: "rightPants",
      parent: "rightLeg",
      pivot: [-1.9, 12.0, 0.0],
      cubes: [
        {
          origin: [-3.9, 0.0, -2.0],
          size: [4, 12, 4],
          uv: [0, 32],
          inflate: 0.25
        }
      ]
    },
    {
      name: "leftLeg",
      parent: "root",
      pivot: [1.9, 12.0, 0.0],
      cubes: [
        {
          origin: [-0.1, 0.0, -2.0],
          size: [4, 12, 4],
          uv: [0, 16]
        }
      ],
      mirror: true
    },
    {
      name: "leftPants",
      parent: "leftLeg",
      pivot: [1.9, 12.0, 0.0],
      cubes: [
        {
          origin: [-0.1, 0.0, -2.0],
          size: [4, 12, 4],
          uv: [0, 48],
          inflate: 0.25
        }
      ]
    },
    {
      name: "leftArm",
      parent: "body",
      pivot: [5.0, 21.5, 0.0],
      cubes: [
        {
          origin: [4.0, 11.5, -2.0],
          size: [3, 12, 4],
          uv: [32, 48]
        }
      ]
    },
    {
      name: "leftSleeve",
      parent: "leftArm",
      pivot: [5.0, 21.5, 0.0],
      cubes: [
        {
          origin: [4.0, 11.5, -2.0],
          size: [3, 12, 4],
          uv: [48, 48],
          inflate: 0.25
        }
      ]
    },
    {
      name: "leftItem",
      pivot: [6, 14.5, 1],
      parent: "leftArm"
    },
    {
      name: "rightArm",
      parent: "body",
      pivot: [-5.0, 21.5, 0.0],
      cubes: [
        {
          origin: [-7.0, 11.5, -2.0],
          size: [3, 12, 4],
          uv: [40, 16]
        }
      ]
    },
    {
      name: "rightSleeve",
      parent: "rightArm",
      pivot: [-5.0, 21.5, 0.0],
      cubes: [
        {
          origin: [-7.0, 11.5, -2.0],
          size: [3, 12, 4],
          uv: [40, 32],
          inflate: 0.25
        }
      ]
    },
    {
      name: "rightItem",
      pivot: [-6, 14.5, 1],
      locators: {
        lead_hold: [-6, 14.5, 1]
      },
      parent: "rightArm"
    },
    {
      name: "jacket",
      parent: "body",
      pivot: [0.0, 24.0, 0.0],
      cubes: [
        {
          origin: [-4.0, 12.0, -2.0],
          size: [8, 12, 4],
          uv: [16, 32],
          inflate: 0.25
        }
      ]
    },
    {
      name: "cape",
      pivot: [0.0, 24, -3.0],
      parent: "body"
    }
  ]
}